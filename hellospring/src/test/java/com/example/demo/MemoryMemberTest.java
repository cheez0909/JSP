package com.example.demo;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.domain.Member;
import com.repository.MemoryMemberRepository;

public class MemoryMemberTest {

	MemoryMemberRepository memoryMemberRepository = new MemoryMemberRepository();
	
	@Test
	public void save() {
		Member member = new Member();
		member.setName("홍길동");
		memoryMemberRepository.save(member);
		Member result = memoryMemberRepository.findById(member.getId()).get();
		assertEquals(member, result);
	}
	
	
}
