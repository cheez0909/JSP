package com.scope;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.config.SingletonBeanRegistry;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Scope;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;

public class SingleTonTest {
	
	@Test
	void singleTonTest() {
		
		AnnotationConfigApplicationContext ac =   new AnnotationConfigApplicationContext(SingleTon.class);
		
		// bean1 인스턴스 생성
		SingleTon bean1 = ac.getBean(SingleTon.class);
		System.out.println(bean1);

		// bean2 인스턴스 생성
		SingleTon bean2 = ac.getBean(SingleTon.class);
		System.out.println(bean2);
		
		// 같은 인스턴스인가
		assertThat(bean1).isSameAs(bean2);
		
		// 소멸
		ac.close();
		
		
	}
	
	@Scope("singleton")
	static class SingleTon{
		
		@PostConstruct
		public void init() {
			System.out.println("SingletonInit");
		}
		
		@PreDestroy
		public void destory() {
			System.out.println("SingletonDestory");
		}
	}

}

