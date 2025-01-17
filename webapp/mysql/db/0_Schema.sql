DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    point  POINT AS (POINT(latitude, longitude)) STORED NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    door_long   INTEGER AS (CASE WHEN door_height > door_width THEN door_height ELSE door_width END),
    door_short  INTEGER AS (CASE WHEN door_height < door_width THEN door_height ELSE door_width END),
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    rev_popularity INTEGER AS (-popularity),
    INDEX door_size(door_long, door_short),
    INDEX geo(latitude, longitude),
    INDEX rev_popularity_id(rev_popularity),
    SPATIAL INDEX point_id(point)
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL,
    rev_popularity INTEGER AS (-popularity),
    INDEX price_id(price),
    INDEX rev_popularity_id(rev_popularity)
);
