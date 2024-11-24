import dash
from dash import dcc, html, dash_table
import pandas as pd
import plotly.express as px
from dash.dependencies import Input, Output
import mysql.connector
# Connect to your database
host = 'localhost'
database = 'dashboard_db'
user = 'root'
password = ''
    
    # Connect to MySQL database
conn = mysql.connector.connect(
    host=host,
    database=database,
    user=user,
    password=password
)

# SQL queries to fetch the data
query_projects = "SELECT * FROM AI_PROJECTS;"
query_models = "SELECT * FROM AI_MODELS;"
query_requests = "SELECT * FROM AI_SERVICEREQUEST;"
query_request_details = "SELECT * FROM AI_SERVICEREQUESTDETAILS;"

# Load data into pandas DataFrames
AI_PROJECTS = pd.read_sql(query_projects, conn)
AI_MODELS = pd.read_sql(query_models, conn)
AI_SERVICEREQUEST = pd.read_sql(query_requests, conn)
AI_SERVICEREQUESTDETAILS = pd.read_sql(query_request_details, conn)

# Close the database connection
conn.close()

# Initialize the Dash app
app = dash.Dash(__name__)

# App Layout
app.layout = html.Div([
    html.H1('AI Project and Model Dashboard'),

    # Dropdown to filter by project ID
    html.Div([
        dcc.Dropdown(
            id='project-dropdown',
            options=[{'label': f"Project {x}", 'value': x} for x in AI_PROJECTS['Id']],
            value=1,  # Default value
            multi=False,
            placeholder="Select a Project"
        )
    ], style={'width': '40%', 'margin': '20px'}),

    # Data Table for AI_PROJECTS
    html.Div([
        html.H3('AI Projects Data'),
        dash_table.DataTable(
            id='ai-projects-table',
            columns=[{'name': col, 'id': col} for col in AI_PROJECTS.columns],
            data=AI_PROJECTS.to_dict('records'),
            style_table={'height': '250px', 'overflowY': 'auto'},
            style_cell={'textAlign': 'center'}
        )
    ], style={'margin': '20px'}),

    # Bar chart showing service request count per project
    html.Div([
        dcc.Graph(id='service-requests-bar')
    ], style={'width': '48%', 'display': 'inline-block'}),

    # Pie chart for model types distribution
    html.Div([
        dcc.Graph(id='model-type-pie')
    ], style={'width': '48%', 'display': 'inline-block'}),

    # Data Table for AI_MODELS
    html.Div([
        html.H3('AI Models Data'),
        dash_table.DataTable(
            id='ai-models-table',
            columns=[{'name': col, 'id': col} for col in AI_MODELS.columns],
            data=AI_MODELS.to_dict('records'),
            style_table={'height': '250px', 'overflowY': 'auto'},
            style_cell={'textAlign': 'center'}
        )
    ], style={'margin': '20px'}),

])

# Callback for updating the bar chart based on selected project
@app.callback(
    Output('service-requests-bar', 'figure'),
    Output('model-type-pie', 'figure'),
    Output('ai-projects-table', 'data'),
    Output('ai-models-table', 'data'),
    Input('project-dropdown', 'value')
)
def update_charts(selected_project):
    # Filter service requests by project
    filtered_requests = AI_SERVICEREQUEST[AI_SERVICEREQUEST['ProjectId'] == selected_project]
    request_counts = filtered_requests.groupby('ProjectId').size().reset_index(name='Request Count')

    # Create bar chart for service requests
    bar_fig = px.bar(request_counts, x='ProjectId', y='Request Count', title='Service Requests per Project')

    # Pie chart for model type distribution
    model_counts = AI_MODELS.groupby('ModelType').size().reset_index(name='Count')
    pie_fig = px.pie(model_counts, names='ModelType', values='Count', title='Model Type Distribution')

    # Filter AI Projects and Models for the selected project
    filtered_projects = AI_PROJECTS[AI_PROJECTS['Id'] == selected_project].to_dict('records')
    filtered_models = AI_MODELS[AI_MODELS['Id'].isin(filtered_requests['ProjectId'].tolist())].to_dict('records')

    return bar_fig, pie_fig, filtered_projects, filtered_models

# Run the app
if __name__ == '__main__':
    app.run_server(debug=True)
