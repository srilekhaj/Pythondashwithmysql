create database dashboard_db;
use dashboard_db;
drop table ai_projects;
show tables;
CREATE TABLE AI_MODELS (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    CoEName VARCHAR(255),
    ServiceProviderName VARCHAR(255),
    DeploymentName VARCHAR(255),
    Route VARCHAR(255),
    ModelType VARCHAR(100),
    DefaultApiVersion VARCHAR(50),
    Host VARCHAR(255),
    TokenLimit INT,
    PromptTokensCost DECIMAL(10,2),
    ChatCompletion DECIMAL(10,2),
    CreatedOn DATETIME,
    UpdatedOn DATETIME,
    Enabled BOOLEAN,
    RequestLimit INT,
    CompletionTokenLimit INT,
    PromptTokenLimit INT,
    CompletionPerTokenCost DECIMAL(10,2),
    PromptPerTokenCost DECIMAL(10,2),
    RuntimePerSecondCost DECIMAL(10,2),
    EndPointUrl VARCHAR(500),
    KeySecretName VARCHAR(255),
    ModelParityGroup VARCHAR(255),
    Region VARCHAR(100),
    ForwardToModelId INT,
    ModelCapability VARCHAR(255)
);
CREATE TABLE AI_PROJECTS (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    StartDate DATETIME,
    EndDate DATETIME,
    AccessLevel VARCHAR(100),
    Status VARCHAR(100),
    AICOEApprover VARCHAR(255),
    StatusUpdatedOn DATETIME,
    PromptReviewEnabled BOOLEAN,
    AIFunction VARCHAR(255),
    AllowedData TEXT,
    ArchitectureLink VARCHAR(500),
    CMDBCI VARCHAR(100),
    DataClassification VARCHAR(100),
    GuardrailDocumentation TEXT,
    InputType VARCHAR(100),
    TSENumber VARCHAR(50),
    RealtimeContentSafetyEnabled BOOLEAN,
    InputSource VARCHAR(255),
    OutputDestination VARCHAR(255),
    ClarityCode VARCHAR(100),
    FinancialPointOfContact VARCHAR(255),
    ValueFrequency VARCHAR(100),
    ValueIdentified DECIMAL(10,2),
    ValueRealized DECIMAL(10,2),
    ValueType VARCHAR(100),
    ApprovedUsageRule TEXT,
    VendApiKeyEnabled BOOLEAN,
    EnableAgents BOOLEAN,
    StudioUsersGroup VARCHAR(255),
    Realtime BOOLEAN,
    RealtimeTopicRestrictionRule TEXT
);

CREATE TABLE AI_SERVICEREQUEST (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Requestor VARCHAR(255),
    RequestSource VARCHAR(255),
    RouteName VARCHAR(255),
    ReceivedOn DATETIME,
    CompletedOn DATETIME,
    ResponseCode VARCHAR(10),
    ParentId INT,
    EstimatedCost DECIMAL(10,2),
    TotalCost DECIMAL(10,2),
    Model VARCHAR(255),
    ProjectId INT,
    ClaimType VARCHAR(50),
    ServiceRoute VARCHAR(255),
    HostName VARCHAR(255),
    ModelExecutionMilliseconds INT,
    UserAgentType VARCHAR(100),
    Classification VARCHAR(100),
    IsStreamRequest BOOLEAN,
    TransactionId VARCHAR(255),
    ExecutedModel VARCHAR(255),
    Remark TEXT
);
CREATE TABLE AI_SERVICEREQUESTDETAILS (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    AIServiceRequestId INT,
    MaxToken INT,
    EstimatedInputToken INT,
    PromptToken INT,
    CompletionToken INT,
    TotalToken INT,
    PromptCost DECIMAL(10,2),
    CompletionCost DECIMAL(10,2),
    ResponseFilePath VARCHAR(500),
    CreatedOn DATETIME,
    ToxicityApplied BOOLEAN,
    RuntimeCost DECIMAL(10,2)
);
INSERT INTO ai_models (CoEName, ServiceProviderName, DeploymentName, Route, ModelType, DefaultApiVersion, Host, TokenLimit, PromptTokensCost, 
                       ChatCompletion, CreatedOn, UpdatedOn, Enabled, RequestLimit, CompletionTokenLimit, PromptTokenLimit, 
                       CompletionPerTokenCost, PromptPerTokenCost, RuntimePerSecondCost, EndPointUrl, KeySecretName, 
                       ModelParityGroup, Region, ForwardToModelId, ModelCapability)
VALUES ('AI Center of Excellence', 'Azure', 'v1-deployment', '/v1/model', 'NLP', '1.0', 'localhost', 1000, 0.05, 0.10, 
        '2024-11-25 08:00:00', '2024-11-25 10:00:00', TRUE, 500, 2000, 1000, 0.02, 0.01, 0.003, 
        'https://api.azure.com/v1', 'model-xyz-key', 'group1', 'US-East', NULL, 'Text Generation');
INSERT INTO ai_models (CoEName, ServiceProviderName, DeploymentName, Route, ModelType, DefaultApiVersion, Host, TokenLimit, PromptTokensCost, 
                       ChatCompletion, CreatedOn, UpdatedOn, Enabled, RequestLimit, CompletionTokenLimit, PromptTokenLimit, 
                       CompletionPerTokenCost, PromptPerTokenCost, RuntimePerSecondCost, EndPointUrl, KeySecretName, 
                       ModelParityGroup, Region, ForwardToModelId, ModelCapability)
VALUES ('AI Center of Excellence', 'Google', 'v2-deployment', '/v2/model', 'Image Recognition', '2.0', 'localhost', 2000, 0.07, 0.12, 
        '2024-11-20 09:00:00', '2024-11-22 11:00:00', TRUE, 1000, 3000, 1500, 0.03, 0.02, 0.004, 
        'https://api.google.com/v2', 'model-abc-key', 'group2', 'US-West', NULL, 'Image Analysis');

INSERT INTO ai_models (CoEName, ServiceProviderName, DeploymentName, Route, ModelType, DefaultApiVersion, Host, TokenLimit, PromptTokensCost, 
                       ChatCompletion, CreatedOn, UpdatedOn, Enabled, RequestLimit, CompletionTokenLimit, PromptTokenLimit, 
                       CompletionPerTokenCost, PromptPerTokenCost, RuntimePerSecondCost, EndPointUrl, KeySecretName, 
                       ModelParityGroup, Region, ForwardToModelId, ModelCapability)
VALUES ('AI Center of Excellence', 'IBM', 'v3-deployment', '/v3/model', 'Speech Recognition', '1.1', 'localhost', 1500, 0.06, 0.11, 
        '2024-11-18 10:00:00', '2024-11-19 12:00:00', TRUE, 800, 2500, 1200, 0.025, 0.015, 0.005, 
        'https://api.ibm.com/v3', 'model-def-key', 'group3', 'EU-Central', NULL, 'Speech-to-Text');

INSERT INTO ai_projects (Name, Description, StartDate, EndDate, AccessLevel, Status, AICOEApprover, StatusUpdatedOn, 
                         PromptReviewEnabled, AIFunction, AllowedData, ArchitectureLink, CMDBCI, DataClassification, 
                         GuardrailDocumentation, InputType, TSENumber, RealtimeContentSafetyEnabled, InputSource, 
                         OutputDestination, ClarityCode, FinancialPointOfContact, ValueFrequency, ValueIdentified, 
                         ValueRealized, ValueType, ApprovedUsageRule, VendApiKeyEnabled, EnableAgents, StudioUsersGroup, 
                         Realtime, RealtimeTopicRestrictionRule)
VALUES ('AI for Customer Support', 'AI project to automate customer support through chatbots', '2024-01-01', '2024-12-31', 
        'Admin', 'Active', 'John Doe', '2024-11-20', TRUE, 'NLP', 'Customer Data, Chat Logs', 'https://link.com', 'CI12345', 
        'Confidential', 'https://docs.com/guardrails', 'Text', 'TSE1234', TRUE, 'Chatbot', 'Support Desk', 'CC-100', 
        'Jane Smith', 50.0, 1000000, 1200000, 'ROI', 'Usage Policy', TRUE, TRUE, 'GroupA', TRUE, 'Restrict to Agents');

INSERT INTO ai_projects (Name, Description, StartDate, EndDate, AccessLevel, Status, AICOEApprover, StatusUpdatedOn, 
                         PromptReviewEnabled, AIFunction, AllowedData, ArchitectureLink, CMDBCI, DataClassification, 
                         GuardrailDocumentation, InputType, TSENumber, RealtimeContentSafetyEnabled, InputSource, 
                         OutputDestination, ClarityCode, FinancialPointOfContact, ValueFrequency, ValueIdentified, 
                         ValueRealized, ValueType, ApprovedUsageRule, VendApiKeyEnabled, EnableAgents, StudioUsersGroup, 
                         Realtime, RealtimeTopicRestrictionRule)
VALUES ('AI for Fraud Detection', 'This project aims to detect fraudulent activities using machine learning.', '2024-05-01', '2024-11-01', 
        'Manager', 'Completed', 'Sarah Lee', '2024-10-15', TRUE, 'ML', 'Transaction Data, Account Data', 'https://arch.link', 'CI98765', 
        'Sensitive', 'https://docs.com/fraud-guardrails', 'Numeric', 'TSE5678', TRUE, 'Transaction System', 'Fraud Alert System', 'FA-200', 
        'Tom Brown', 120.0, 5000000, 6000000, 'Risk Reduction', 'Policy X', FALSE, TRUE, 'GroupB', FALSE, 'Restrict Access to Users');

INSERT INTO ai_projects (Name, Description, StartDate, EndDate, AccessLevel, Status, AICOEApprover, StatusUpdatedOn, 
                         PromptReviewEnabled, AIFunction, AllowedData, ArchitectureLink, CMDBCI, DataClassification, 
                         GuardrailDocumentation, InputType, TSENumber, RealtimeContentSafetyEnabled, InputSource, 
                         OutputDestination, ClarityCode, FinancialPointOfContact, ValueFrequency, ValueIdentified, 
                         ValueRealized, ValueType, ApprovedUsageRule, VendApiKeyEnabled, EnableAgents, StudioUsersGroup, 
                         Realtime, RealtimeTopicRestrictionRule)
VALUES ('AI for Financial Forecasting', 'Using AI for predicting stock prices and market trends.', '2024-02-01', '2024-12-31', 
        'Admin', 'Active', 'James White', '2024-11-10', TRUE, 'Forecasting', 'Stock Data, Economic Data', 'https://forecast.link', 'CI67890', 
        'Public', 'https://docs.com/forecast-guardrails', 'Time-Series', 'TSE4321', FALSE, 'Market Data', 'Financial Dashboard', 'FM-300', 
        'Lisa Green', 200.0, 3000000, 3500000, 'Prediction Accuracy', 'Usage Policy', TRUE, FALSE, 'GroupC', TRUE, 'None');

INSERT INTO AI_SERVICEREQUEST (Requestor, RequestSource, RouteName, ReceivedOn, CompletedOn, ResponseCode, ParentId, 
                            EstimatedCost, TotalCost, Model, ProjectId, ClaimType, ServiceRoute, HostName, 
                            ModelExecutionMilliseconds, UserAgentType, Classification, IsStreamRequest, TransactionId, 
                            ExecutedModel, Remark)
VALUES ('Alice', 'Web', '/v1/process', '2024-11-24 08:00:00', '2024-11-24 08:10:00', '200', NULL, 150.00, 180.00, 
        'AI Model X', 1, 'Standard', 'Predict', 'localhost', 350, 'Chrome', 'General', FALSE, 'txn1234', 'Model XYZ', 'Processed data.');

INSERT INTO ai_servicerequest (Requestor, RequestSource, RouteName, ReceivedOn, CompletedOn, ResponseCode, ParentId, 
                            EstimatedCost, TotalCost, Model, ProjectId, ClaimType, ServiceRoute, HostName, 
                            ModelExecutionMilliseconds, UserAgentType, Classification, IsStreamRequest, TransactionId, 
                            ExecutedModel, Remark)
VALUES ('Bob', 'Mobile', '/v1/analyze', '2024-11-24 10:00:00', '2024-11-24 10:30:00', '200', NULL, 220.00, 250.00, 
        'AI Model Y', 2, 'Premium', 'Analyze', 'mobile-host', 500, 'Safari', 'Sensitive', TRUE, 'txn5678', 'Model ABC', 'Analysis completed.');

INSERT INTO ai_servicerequest (Requestor, RequestSource, RouteName, ReceivedOn, CompletedOn, ResponseCode, ParentId, 
                            EstimatedCost, TotalCost, Model, ProjectId, ClaimType, ServiceRoute, HostName, 
                            ModelExecutionMilliseconds, UserAgentType, Classification, IsStreamRequest, TransactionId, 
                            ExecutedModel, Remark)
VALUES ('Charlie', 'API', '/v1/predict', '2024-11-25 08:30:00', '2024-11-25 08:35:00', '500', NULL, 180.00, 200.00, 
        'AI Model Z', 3, 'Basic', 'Predict', 'api-server', 420, 'Postman', 'General', FALSE, 'txn9876', 'Model DEF', 'Error occurred during prediction.');

INSERT INTO AI_SERVICEREQUESTDETAILS (AIServiceRequestId, MaxToken, EstimatedInputToken, PromptToken, CompletionToken, 
                                       TotalToken, PromptCost, CompletionCost, ResponseFilePath, CreatedOn, 
                                       ToxicityApplied, RuntimeCost)
VALUES (1, 1000, 500, 200, 300, 1000, 10.00, 15.00, '/files/responses/1.json', '2024-11-24 08:05:00', TRUE, 5.00);

INSERT INTO AI_SERVICEREQUESTDETAILS (AIServiceRequestId, MaxToken, EstimatedInputToken, PromptToken, CompletionToken, 
                                       TotalToken, PromptCost, CompletionCost, ResponseFilePath, CreatedOn, 
                                       ToxicityApplied, RuntimeCost)
VALUES (2, 1500, 800, 300, 400, 1500, 12.00, 18.00, '/files/responses/2.json', '2024-11-24 10:05:00', FALSE, 6.00);

INSERT INTO AI_SERVICEREQUESTDETAILS (AIServiceRequestId, MaxToken, EstimatedInputToken, PromptToken, CompletionToken, 
                                       TotalToken, PromptCost, CompletionCost, ResponseFilePath, CreatedOn, 
                                       ToxicityApplied, RuntimeCost)
VALUES (3, 1200, 600, 250, 350, 1200, 11.00, 16.00, '/files/responses/3.json', '2024-11-25 08:40:00', TRUE, 4.50);

select * from AI_MODELS;
select * from AI_PROJECTS;
select * from AI_SERVICEREQUEST;
select * from AI_SERVICEREQUESTDETAILS;

