package com.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.sound.midi.Sequence;

import com.domain.Member;

public class MemoryMemberRepository implements MemberRepository{

	// 멤버는 키, 값 Map으로 받는다
	private static Map<Long, Member> users = new HashMap<>();
	
	// 시퀀스 만들기
	private static long Sequence = 0L;
	
	@Override
	public Member save(Member member) {
		// 시퀀스 추가
		member.setId(++Sequence);
		// 멤버 저장
		users.put(member.getId(), member);
		return member;
	}

	@Override
	public Optional<Member> findById(Long id) {
		return Optional.ofNullable(users.get(id));
	}

	@Override
	public Optional<Member> findByName(String name) {
		return users.values().stream().filter(x -> x.getName().equals(name)).findAny();
	}

	@Override
	public List<Member> findAll() {
		return new ArrayList<>(users.values());
	}
	
	public void clear() {
		users.clear();
	}
	

}
