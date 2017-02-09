package csd.configuraciones;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import csd.modelo.servicios.ServicioAutentificacion;



@Configuration
@EnableWebSecurity

public class ConfiguracionSeguridad extends  WebSecurityConfigurerAdapter{
	@Autowired
	private ServicioAutentificacion servicioAutentificacion;
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		/*auth
			.userDetailsService(servicioAutentificacion)
			.passwordEncoder(encoder());*/
	auth.inMemoryAuthentication().withUser("admin").password("admin").roles("ADMIN");
	}

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/jugador/**","/federacion/**","/equipos/**").hasRole("ADMIN")
				.anyRequest().permitAll()
		.and()
			.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/autentificar")
				.defaultSuccessUrl("/jugador")
				.failureUrl("/login?semacesso=true")
				.usernameParameter("username")
				.passwordParameter("password")
				
			.and()
				.logout()
					.logoutUrl("/salir")
					.logoutSuccessUrl("/login?salir=true");
	}
	
	@Bean
	public BCryptPasswordEncoder encoder(){
		return new BCryptPasswordEncoder();
	}
	
	
}
