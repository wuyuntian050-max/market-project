package com.yuanlrc.campus_market.entity.common;

import javax.persistence.*;
import java.util.Date;

/**
 * 消息通知实体类
 */
@Entity
@Table(name = "ylrc_message")
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student; // 接收消息的学生

    @ManyToOne
    @JoinColumn(name = "sender_id")
    private Student sender; // 发送者（可为空）

    @Column(name = "type")
    private Integer type; // 1-商品评论 2-评论回复 3-系统通知

    @Column(name = "title")
    private String title;

    @Column(name = "content", length = 1000)
    private String content;

    @ManyToOne
    @JoinColumn(name = "goods_id")
    private Goods goods; // 关联的商品（可为空）

    @ManyToOne
    @JoinColumn(name = "comment_id")
    private Comment comment; // 关联的评论（可为空）

    @Column(name = "is_read")
    private Boolean isRead = false;

    // getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Student getSender() {
        return sender;
    }

    public void setSender(Student sender) {
        this.sender = sender;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public Boolean getIsRead() {
        return isRead;
    }

    public void setIsRead(Boolean isRead) {
        this.isRead = isRead;
    }
}