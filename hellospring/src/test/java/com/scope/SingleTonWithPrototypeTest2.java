package com.scope;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.SingletonBeanRegistry;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Scope;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.inject.Provider;

public class SingleTonWithPrototypeTest2 {
	
//	@Test
//	@DisplayName("싱글톤에서 프로토타입 빈 사용하기")
//	void ClientBeanTest() {
//		
//		AnnotationConfigApplicationContext ac =   new AnnotationConfigApplicationContext(ClientBean.class, Prototype1.class);
//		
//		ClientBean bean1 = ac.getBean(ClientBean.class);
//		System.out.println(bean1.logic());
//		
//		ClientBean bean2 = ac.getBean(ClientBean.class);
//		System.out.println(bean2.logic());
//		
//		ac.close(); // 출력되지 않음
//	}
	
	@Test
	@DisplayName("싱글톤에서 프로토타입 빈 사용하기")
	void ClientBeanTest1() {
		AnnotationConfigApplicationContext ac =   new AnnotationConfigApplicationContext(ClientBean1.class, Prototype1.class);
		ClientBean1 bean1 = ac.getBean(ClientBean1.class);
		System.out.println(bean1.logic());
		ClientBean1 bean2 = ac.getBean(ClientBean1.class);
		System.out.println(bean2.logic());
		
		
		ac.close(); // 출력되지 않음
	}
	
	
	static class ClientBean{
		
		private final ObjectProvider<Prototype1> prototypeProvider;
		
		public ClientBean(ObjectProvider<Prototype1> prototypeProvider) {
			this.prototypeProvider = prototypeProvider;
		}

		public int logic() {
			Prototype1 prototypebean = prototypeProvider.getObject();
			prototypebean.addCount();
			return prototypebean.getCount();
		}
	}
	
	
	static class ClientBean1{
		
		private final Provider<Prototype1> providers;
		
		public ClientBean1(Provider<Prototype1> providers) {
			super();
			this.providers = providers;
		}

		public int logic() {
			Prototype1 prototypebean = providers.get();
			prototypebean.addCount();
			return prototypebean.getCount();
		}
	}
	
	
	
	@Scope("prototype")
	static class Prototype1{
		
		private int count=0;
		
		@PostConstruct
		public void init() {
			System.out.println("PrototypeInit" + this);
		}
		
		public void addCount() {
			count++;
		}
		
		public int getCount() {
			return count;
		}
		
		@PreDestroy
		public void destory() {
			System.out.println("PrototypeDestory");
		}
	}

}

