package com.etc.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class CustomPasswordEncoder implements PasswordEncoder {
    //编码
    @Override
    public String encode(CharSequence charSequence) {
        return charSequence.toString();
    }
    //解码验证
    @Override
    public boolean matches(CharSequence charSequence, String s) {
        return s.equals(charSequence.toString());
    }
}
