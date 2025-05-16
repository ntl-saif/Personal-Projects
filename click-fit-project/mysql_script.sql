
-- Create users table
CREATE TABLE users (
  userId INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  type ENUM('admin', 'user') DEFAULT 'user',
  active BOOLEAN DEFAULT TRUE
);

-- Stored Procedure to add user
DELIMITER //
CREATE PROCEDURE addUser(
  IN p_email VARCHAR(100),
  IN p_password VARCHAR(100),
  IN p_type ENUM('admin', 'user'),
  IN p_active BOOLEAN
)
BEGIN
  INSERT INTO users (email, password, type, active)
  VALUES (p_email, p_password, p_type, p_active);
END //
DELIMITER ;

-- Call to add a user
CALL addUser('saif@example.com', 'secure123', 'user', TRUE);
