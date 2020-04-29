SecureHeaders::Configuration.default do |config|
    config.cookies = {
        secure: true, # mark all cookies as "Secure"
        httponly: true, # mark all cookies as "HttpOnly"
        samesite: {
            lax: true
        }
    }
    config.hsts = "max-age=#{1.week.to_i}"
    config.x_frame_options = "DENY"
    config.x_content_type_options = "nosniff"
    config.x_xss_protection = "1; mode=block"
    config.x_download_options = "noopen"
    config.x_permitted_cross_domain_policies = "none"
    config.referrer_policy = %w(strict-origin-when-cross-origin)
    config.csp = SecureHeaders::OPT_OUT
end