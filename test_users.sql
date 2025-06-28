-- Test users for the application
-- Password for all users is: "password123"
-- The hash below is the SHA256 hash of "password123"

-- Simple test user
INSERT INTO [dbo].[Users] ([Email], [Name], [PasswordHash], [Tel]) VALUES 
('test@test.com', 'Test User', 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7', '123-456-7890');

-- Additional test users
INSERT INTO [dbo].[Users] ([Email], [Name], [PasswordHash], [Tel]) VALUES 
('admin@test.com', 'Administrator', 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7', '+36 1 234 5678'),
('user1@test.com', 'Test User 1', 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7', '+36 20 123 4567'),
('user2@test.com', 'Test User 2', 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7', '+36 30 987 6543');

-- Sample user ratings (optional)
INSERT INTO [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES
(1, 1, 5, GETDATE()),
(1, 2, 4, GETDATE()),
(2, 1, 4, GETDATE()),
(2, 3, 5, GETDATE()),
(3, 1, 3, GETDATE()),
(3, 2, 5, GETDATE()),
(3, 3, 4, GETDATE());
