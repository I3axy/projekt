-- IDEIGLENES SCRIPT: Jelszavak átállítása egyszerű szövegre
-- FIGYELEM: Ez csak fejlesztési/hibakeresési célra!
-- ÉLES KÖRNYEZETBEN SOHA NE HASZNÁLJ PLAIN TEXT JELSZAVAKAT!

-- ======== EREDETI HASH ALAPÚ JELSZAVAK VISSZAÁLLÍTÁSÁHOZ ========
-- Az eredeti hash értékek (SHA256 "password123"):
-- 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7'
-- 
-- Visszaállítás script:
-- UPDATE [dbo].[Users] SET [PasswordHash] = 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7' WHERE [Email] = 'test@test.com';
-- UPDATE [dbo].[Users] SET [PasswordHash] = 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7' WHERE [Email] = 'admin@test.com';
-- UPDATE [dbo].[Users] SET [PasswordHash] = 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7' WHERE [Email] = 'user1@test.com';
-- UPDATE [dbo].[Users] SET [PasswordHash] = 'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7' WHERE [Email] = 'user2@test.com';
-- ======== HASH VISSZAÁLLÍTÁS VÉGE ========

-- IDEIGLENES: Jelszavak átállítása egyszerű szövegre
UPDATE [dbo].[Users] SET [PasswordHash] = 'password123' WHERE [Email] = 'test@test.com';
UPDATE [dbo].[Users] SET [PasswordHash] = 'password123' WHERE [Email] = 'admin@test.com';
UPDATE [dbo].[Users] SET [PasswordHash] = 'password123' WHERE [Email] = 'user1@test.com';
UPDATE [dbo].[Users] SET [PasswordHash] = 'password123' WHERE [Email] = 'user2@test.com';

-- Ellenőrzés: Listázza ki az összes felhasználót és jelszavukat
SELECT [Email], [Name], [PasswordHash] FROM [dbo].[Users];
