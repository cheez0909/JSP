package com.repository;

import java.util.List;
import java.util.Optional;

import com.domain.Member;

public interface MemberRepository {
	// 저장
	Member save(Member member);
	// id조회
	Optional<Member> findById(Long id);
	// 이름 조회
	Optional<Member> findByName(String name);

	// 전체 조회
	List<Member> findAll();
}
