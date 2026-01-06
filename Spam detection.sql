CREATE TABLE emails (
    "Category" VARCHAR(10),
    "Message" TEXT,
    message_length INT,
    word_count INT,
    clean_message TEXT
);

DROP TABLE emails;

CREATE TABLE emails (
    "Category" VARCHAR(10),
    "Message" TEXT,
    message_length INT,
    word_count INT,
    clean_message TEXT
);

SELECT * FROM emails LIMIT 10;


"""Count total emails"""
SELECT COUNT(*) AS total_emails
FROM emails;

"""Count spam vs ham"""
SELECT category, COUNT(*) AS count
FROM emails
GROUP BY category;

"""Spam Percentage: “How much spam traffic exists in the system?”"""
SELECT 
  ROUND(
    SUM(CASE WHEN category = 'spam' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS spam_percentage
FROM emails;

"""Average message length by catogory: Spam emails are usually longer or more repetitive."""
SELECT 
  category,
  ROUND(AVG(message_length), 2) AS avg_length
FROM emails
GROUP BY category;

"""Average word count by category"""
SELECT 
  category,
  ROUND(AVG(word_count), 2) AS avg_word_count
FROM emails
GROUP BY category;

"""Longest spam email:Useful for spam pattern analysis."""
SELECT message, message_length
FROM emails
WHERE category = 'spam'
ORDER BY message_length DESC
LIMIT 5;

"""Top Spam Keywords:(PostgreSQL NLP-style)"""
SELECT word, COUNT(*) AS frequency
FROM (
  SELECT unnest(string_to_array(clean_message, ' ')) AS word
  FROM emails
  WHERE category = 'spam'
) t
GROUP BY word
ORDER BY frequency DESC
LIMIT 15;

"""Spam vs Ham diversity"""
SELECT 
  category,
  COUNT(DISTINCT word) AS unique_words
FROM (
  SELECT category, unnest(string_to_array(clean_message, ' ')) AS word
  FROM emails
) t
GROUP BY category;

"""Identify Spam like long Emails"""
SELECT message, message_length
FROM emails
WHERE message_length > (
  SELECT AVG(message_length) FROM emails
)
ORDER BY message_length DESC;


"""Extracting Training data"""
SELECT clean_message, category
FROM emails;

"""Prepare PostgreSQL for PowerBI"""
SELECT 
    category,
    COUNT(*) AS email_count,
    AVG(message_length) AS avg_message_length,
    AVG(word_count) AS avg_word_count
FROM emails
GROUP BY category;






