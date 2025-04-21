-- server/migrations/001_create_sessions_table.sql
CREATE TABLE IF NOT EXISTS Sessions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  interpreter_id INT NOT NULL,
  start_ts DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  end_ts DATETIME NULL,
  coins_spent INT NOT NULL DEFAULT 0,
  INDEX idx_user (user_id),
  INDEX idx_interpreter (interpreter_id),
  FOREIGN KEY (user_id) REFERENCES Users(id),
  FOREIGN KEY (interpreter_id) REFERENCES Interpreters(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;