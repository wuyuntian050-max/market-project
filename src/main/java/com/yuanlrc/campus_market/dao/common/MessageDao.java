package com.yuanlrc.campus_market.dao.common;

import com.yuanlrc.campus_market.entity.common.Message;
import com.yuanlrc.campus_market.entity.common.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageDao extends JpaRepository<Message, Long> {

    // 查询用户的所有消息（按创建时间倒序）
    List<Message> findByStudentOrderByCreateTimeDesc(Student student);

    // 查询用户的未读消息
    List<Message> findByStudentAndIsReadFalseOrderByCreateTimeDesc(Student student);

    // 统计用户未读消息数量
    Long countByStudentAndIsReadFalse(Student student);

    // 分页查询用户消息
    Page<Message> findByStudentOrderByCreateTimeDesc(Student student, Pageable pageable);

    // 根据学生ID分页查询消息
    @Query("select m from Message m where m.student.id = :studentId order by m.createTime desc")
    Page<Message> findByStudentIdOrderByCreateTimeDesc(@Param("studentId") Long studentId, Pageable pageable);
}