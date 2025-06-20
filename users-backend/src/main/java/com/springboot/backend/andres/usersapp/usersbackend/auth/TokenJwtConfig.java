package com.springboot.backend.andres.usersapp.usersbackend.auth;

import javax.crypto.SecretKey;

import io.jsonwebtoken.Jwts;

public class TokenJwtConfig {

    public static final String CONTENT_TYPE = "application/json";
    public static final String PREFIX_TOKEN = "Bearer ";
    public static final String HEADER_AUTHORIZATION = "Authorization";
    public static final Integer EXPIRATION = 3600000; // 1 hour in milliseconds
    public static final SecretKey SECRET_KEY = Jwts.SIG.HS256.key().build();
}
