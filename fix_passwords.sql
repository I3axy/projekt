-- Update existing user passwords with correct hash
-- Password for all users: "password123"
-- Correct SHA256 hash: EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F

UPDATE [dbo].[Users] 
SET [PasswordHash] = 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F'
WHERE [Email] IN ('test@test.com', 'admin@test.com', 'user1@test.com', 'user2@test.com');

-- Verify the update
SELECT [Email], [Name], [PasswordHash] FROM [dbo].[Users] 
WHERE [Email] IN ('test@test.com', 'admin@test.com', 'user1@test.com', 'user2@test.com');
