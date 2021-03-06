package com.devpro.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.devpro.site.security.oauth.UserOAuth2UserService;

@Configuration
@EnableWebSecurity
public class SecureConf extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private AuthenticationSuccessHandler successHandler;
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	@Override
	protected AuthenticationManager authenticationManager() throws Exception {
		// TODO Auto-generated method stub
		return super.authenticationManager();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception  {
		http
	    .csrf().disable();
		
		http
	    .authorizeRequests()
			.antMatchers("/admin/home").hasAnyAuthority("ADMIN")
	    	.antMatchers("/").permitAll()
	    	.antMatchers("/oauth2").permitAll()
		.and()
		.formLogin()
		    .loginPage("/login")
		    .usernameParameter("username")
			.passwordParameter("password")
			.successHandler(successHandler)
			.failureUrl("/login?login_error=true")
		 .and()
		 .oauth2Login()
		 	.loginPage("/login")
		 	.userInfoEndpoint().userService(oAuth2UserService)
		 .and()
		 .and()
		 .logout()
		    .logoutUrl("/logout")
		    .logoutSuccessUrl("/login?logout")
            .and()
		.exceptionHandling().accessDeniedPage("/login?accessDenied");
//		http.csrf().disable().authorizeRequests() // th???c hi???n x??c th???c request ng???????i d??ng g???i l??n.
//			
//			// kh??ng th???c hi???n x??c th???c ?????i v???i c??c ur/ n??y.
//	            .antMatchers("/css/**", "/js/**", "/img/**", "/vendor/**"
//	            		, "/font-awesome/**", "/summernote/**", "/files/**").permitAll()
//	            
//	            // th???c hi???n x??c th???c v???i c??c url ki???u ..../admin/....
//	            //.antMatchers("/admin/home").hasAnyAuthority("ADMIN")
//	//            .antMatchers("/admin/**").authenticated()
//		        .antMatchers("/home").hasRole("USER")
//				.antMatchers("/admin/home").hasRole("ADMIN")
//	            .and() // k???t h???p v???i ??i???u ki???n.
//            .formLogin()
//	            .loginPage("/login")
//			    .usernameParameter("username")
//				.passwordParameter("password")
//				.successHandler(successHandler)
//				//.loginProcessingUrl("/login") 
//				.failureUrl("/login?login_error=true")
//				.and()
//			.logout()
//			    .logoutUrl("/logout")
//			    .logoutSuccessUrl("/home")
//	            .permitAll()
//				.and()
//			.exceptionHandling().accessDeniedPage("/login?accessDenied");
            
            // khi click v??o button logout th?? kh??ng c???n login.
            // khi click v??o button n??y th?? d??? li???u user tr??n session s??? b??? xo??.
//            .logout()
//            .logoutUrl("/logout")
//            .logoutSuccessUrl("/home")
//            .invalidateHttpSession(true) // xo?? h???t d??? li???u tr??n seesion
//            .deleteCookies("JSESSIONID") // xo?? h???t d??? li???u tr??n cokies.
//            .permitAll()
//            
//            .and() // k???t h???p v???i ??i???u ki???n.
//            
//            .formLogin() // th???c hi???n x??c th???c qua form(username v?? password)
//            .loginPage("/login") // trang login do m??nh thi???t k???.
//            .loginProcessingUrl("/perform_login") // link action for form post.
//            .defaultSuccessUrl("/home", true) // when user success authenticated then go to this url.
//            .failureUrl("/login?login_error=true") // nh???p username, password sai th?? redirect v??? trang n??o.
//            .permitAll();
	}
	
	@Autowired
	private UserOAuth2UserService oAuth2UserService;
	
}
