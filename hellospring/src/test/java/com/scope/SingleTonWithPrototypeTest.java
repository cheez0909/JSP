package com.scope;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.SingletonBeanRegistry;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Scope;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;

public class SingleTonWithPrototypeTest {
	
//	@Test
//	void PrototypeTest() {
//		
//		AnnotationConfigApplicationContext ac =   new AnnotationConfigApplicationContext(Prototype1.class);
//		
//		// 프로토스코프 타입의 인스턴스 bean1 생성
//		Prototype1 bean1 = ac.getBean(Prototype1.class);
//		// 카운트추가
//		bean1.addCount();
//		// bean1에 저장된 카운트
//		System.out.println(bean1.getCount()); // 1
//				
//				
//		// 프로토스코프 타입의 인스턴스 bean2 생성
//		Prototype1 bean2 = ac.getBean(Prototype1.class);
//		// 카운트 추가
//		bean2.addCount();
//		// bean2에 저장된 카운트
//		System.out.println(bean2.getCount()); // 1
//		
//		assertThat(bean1.getCount()).isEqualTo(1);
//		assertThat(bean2.getCount()).isEqualTo(1);
//		
//		ac.close(); // 출력되지 않음
//	}
	
	@Test
	void ClientBeanTest() {
		
		// 싱글톤 빈에 프로토타입 스코프를 변수로 선언했을 경우
		// 즉, 싱글톤 컨테이너에서 프로토타입 스코프를 사용할 경우
		AnnotationConfigApplicationContext ac =   new AnnotationConfigApplicationContext(ClientBean.class, Prototype1.class);
		
		 
		// bean1 인스턴스 생성
		ClientBean bean1 = ac.getBean(ClientBean.class);
		// bean1 로직실행
		System.out.println(bean1.logic());
		
		// bean2 인스턴스 생성
		ClientBean bean2 = ac.getBean(ClientBean.class);
		// bean2 로직 실행
		System.out.println(bean2.logic());
		
		ac.close(); // 출력되지 않음
	}
	
	
	
	static class ClientBean{
		
		private final Prototype1 prototype1;
		
		@Autowired
		public ClientBean(Prototype1 prototype1) {
			this.prototype1 = prototype1;
		}

		// 로직에 addcount를 넣었을 경우
		public int logic() {
			prototype1.addCount();
			return prototype1.getCount();
		}
	}
	
	
	
	@Scope("prototype")
	static class Prototype1{
		
		private int count=0;
		
		// 초기화
		@PostConstruct
		public void init() {
			System.out.println("PrototypeInit : " + this);
		}
		
		public void addCount() {
			count++;
		}
		
		public int getCount() {
			return count;
		}
		
		// 소멸
		@PreDestroy
		public void destory() {
			System.out.println("PrototypeDestory");
		}
	}

}

