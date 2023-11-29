package com.scope;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.config.SingletonBeanRegistry;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Scope;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;

public class PrototypeTest {
	
	@Test
	void prototypeTest() {
		// 스프링 컨테이너로 등록
		AnnotationConfigApplicationContext ac =   new AnnotationConfigApplicationContext(Prototype.class);
		
		// bean1 인스턴스 생성 
		Prototype bean1 = ac.getBean(Prototype.class);
		System.out.println(bean1);
		
		// bean2 인스턴스 생성 
		Prototype bean2 = ac.getBean(Prototype.class);
		System.out.println(bean2);
		
		assertThat(bean1).isNotSameAs(bean2);
		
		// 소멸 (호출되지 않음)
		ac.close();
		
	}
	
	// 프로토타입 스코프로 지정
	@Scope("prototype")
	static class Prototype{
		
		// 초기화 
		@PostConstruct
		public void init() {
			System.out.println("PrototypeInit");
		}
		
		// 소멸
		@PreDestroy
		public void destory() {
			System.out.println("PrototypeDestory");
		}
	}

}

