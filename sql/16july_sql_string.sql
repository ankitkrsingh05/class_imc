-- String Functions in PostgreSQL

-- 1. CONCAT: Concatenate strings
SELECT CONCAT('Hello', ' ', 'World') AS concatenated_string;

-- 2. CONCAT_WS: Concatenate strings with a separator
SELECT CONCAT_WS(' - ', 'Hello', 'World', 'PostgreSQL') AS concatenated_with_separator;

-- 3. LENGTH: Get the length of a string
SELECT LENGTH('PostgreSQL') AS string_length;

-- 4. CHAR_LENGTH: Get the number of characters in a string
SELECT CHAR_LENGTH('PostgreSQL') AS char_length;

-- 5. POSITION: Get the position of a substring
SELECT POSITION('SQL' IN 'PostgreSQL') AS position;

-- 6. SUBSTRING: Extract a substring from a string
SELECT SUBSTRING('PostgreSQL' FROM 6 FOR 3) AS substring;

-- 7. LEFT: Get the left part of a string
SELECT LEFT('PostgreSQL', 4) AS left_part;

-- 8. RIGHT: Get the right part of a string
SELECT RIGHT('PostgreSQL', 4) AS right_part;

-- 9. TRIM: Remove leading and trailing spaces
SELECT TRIM('  PostgreSQL  ') AS trimmed_string;

-- 10. LTRIM: Remove leading spaces
SELECT LTRIM('  PostgreSQL') AS left_trimmed;

-- 11. RTRIM: Remove trailing spaces
SELECT RTRIM('PostgreSQL  ') AS right_trimmed;

-- 12. LPAD: Pad a string on the left side
SELECT LPAD('PostgreSQL', 15, 'x') AS left_padded;

-- 13. RPAD: Pad a string on the right side
SELECT RPAD('PostgreSQL', 15, 'x') AS right_padded;

-- 14. REPLACE: Replace all occurrences of a substring
SELECT REPLACE('PostgreSQL', 'Post', 'My') AS replaced_string;

-- 15. REVERSE: Reverse a string
SELECT REVERSE('PostgreSQL') AS reversed_string;

-- 16. INITCAP: Capitalize the first letter of each word
SELECT INITCAP('postgresql database') AS initcap_string;

-- 17. LOWER: Convert a string to lowercase
SELECT LOWER('PostgreSQL') AS lower_case;

-- 18. UPPER: Convert a string to uppercase
SELECT UPPER('PostgreSQL') AS upper_case;

-- 19. SPLIT_PART: Split a string and get a part
SELECT SPLIT_PART('one,two,three,four', ',', 3) AS split_part;

-- 20. STRING_TO_ARRAY: Convert a string to an array
SELECT STRING_TO_ARRAY('one,two,three', ',') AS string_array;

-- 21. ARRAY_TO_STRING: Convert an array to a string
SELECT ARRAY_TO_STRING(ARRAY['one', 'two', 'three'], ',') AS array_string;

-- 22. FORMAT: Format a string
SELECT FORMAT('Hello, %s!', 'World') AS formatted_string;


-- 23. LEFT: Get a substring from the left
SELECT LEFT('PostgreSQL', 4) AS left_substring;

-- 24. RIGHT: Get a substring from the right
SELECT RIGHT('PostgreSQL', 4) AS right_substring;

-- 25. MD5: Calculate the MD5 hash of a string
SELECT MD5('PostgreSQL') AS md5_hash;

-- 26. SPLIT_PART: Split a string and get a specific part
SELECT SPLIT_PART('abc,def,ghi,jkl', ',', 2) AS split_string;

-- 27. TO_HEX: Convert a string to hexadecimal
SELECT TO_HEX(12345) AS hex_string;

-- 28. ENCODE: Encode a bytea string
SELECT ENCODE('PostgreSQL'::bytea, 'base64') AS encoded_string;

-- 29. DECODE: Decode a bytea string
SELECT DECODE('UG9zdGdyZVNxbA==', 'base64')::text AS decoded_string;

-- 30. BTRIM: Remove the longest string containing only characters from the trim_chars parameter from the start and end of string
SELECT BTRIM('xyxtrimxyx', 'xy') AS btrimmed_string;
