CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE ideas (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    explanation TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    votes INT DEFAULT 0 NOT NULL,
    author_id UUID NOT NULL
);
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);

ALTER TABLE ideas ADD CONSTRAINT posts_ref_user_id FOREIGN KEY (author_id) REFERENCES users (id) ON DELETE NO ACTION;
