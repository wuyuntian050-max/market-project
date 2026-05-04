package com.yuanlrc.campus_market.service.common;

import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.dao.common.MessageDao;
import com.yuanlrc.campus_market.entity.common.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MessageService {

    @Autowired
    private MessageDao messageDao;

    @Autowired
    private StudentService studentService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private CommentService commentService;

    /**
     * 发送商品评论通知
     */
    public void sendCommentNotification(Long goodsId, Long commentId, Long senderId) {
        try {
            Goods goods = goodsService.findById(goodsId);
            if (goods == null) return;

            Student receiver = goods.getStudent(); // 商品主人
            Student sender = studentService.findById(senderId);
            Comment comment = commentService.find(commentId);

            if (receiver != null && sender != null && comment != null) {
                // 创建消息
                Message message = new Message();
                message.setStudent(receiver);
                message.setSender(sender);
                message.setType(1); // 商品评论
                message.setTitle("有人评论了您的商品");
                message.setContent(sender.getNickname() + " 评论了您的商品《" + goods.getName() + "》： " + comment.getContent());
                message.setGoods(goods);
                message.setComment(comment);
                message.setCreateTime(new Date());
                message.setUpdateTime(new Date());
                message.setIsRead(false);

                // 保存消息
                messageDao.save(message);
            }
        } catch (Exception e) {
            // 记录错误日志，但不影响主流程
            e.printStackTrace();
        }
    }

    /**
     * 发送评论回复通知
     */
    public void sendReplyNotification(Long commentId, Long replyCommentId, Long senderId) {
        Comment parentComment = commentService.find(commentId);
        Comment replyComment = commentService.find(replyCommentId);

        if (parentComment != null && replyComment != null) {
            Student receiver = parentComment.getStudent(); // 被回复的人
            Student sender = studentService.findById(senderId);

            Message message = new Message();
            message.setStudent(receiver);
            message.setSender(sender);
            message.setType(2); // 评论回复
            message.setTitle("有人回复了您的评论");
            message.setContent(sender.getNickname() + " 回复了您的评论： " + replyComment.getContent());
            message.setGoods(parentComment.getGoods());
            message.setComment(replyComment);
            message.setCreateTime(new Date());
            message.setUpdateTime(new Date());
            messageDao.save(message);
        }
    }

    /**
     * 获取用户消息列表（分页）
     */
    public PageBean<Message> findList(PageBean<Message> pageBean, Long studentId) {
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize(),
                Sort.Direction.DESC, "createTime");
        Page<Message> page = messageDao.findByStudentIdOrderByCreateTimeDesc(studentId, pageable);
        pageBean.setContent(page.getContent());
        pageBean.setTotal(page.getTotalElements());
        pageBean.setTotalPage(page.getTotalPages());
        return pageBean;
    }

    /**
     * 获取未读消息数量
     */
    public Long getUnreadCount(Long studentId) {
        Student student = studentService.findById(studentId);
        if (student == null) return 0L;

        return messageDao.countByStudentAndIsReadFalse(student);
    }

    /**
     * 标记消息为已读
     */
    public void markAsRead(Long messageId) {
        Message message = messageDao.findById(messageId).orElse(null);
        if (message != null && !message.getIsRead()) {
            message.setIsRead(true);
            message.setUpdateTime(new Date());
            messageDao.save(message);
        }
    }

    /**
     * 标记所有消息为已读
     */
    public void markAllAsRead(Long studentId) {
        Student student = studentService.findById(studentId);
        if (student != null) {
            List<Message> unreadMessages = messageDao.findByStudentAndIsReadFalseOrderByCreateTimeDesc(student);
            Date now = new Date();
            for (Message message : unreadMessages) {
                message.setIsRead(true);
                message.setUpdateTime(now);
            }
            messageDao.saveAll(unreadMessages);
        }
    }

    /**
     * 根据ID查找消息
     */
    public Message find(Long id) {
        return messageDao.findById(id).orElse(null);
    }

    /**
     * 保存消息
     */
    public Message save(Message message) {
        return messageDao.save(message);
    }

    /**
     * 删除消息
     */
    public void delete(Long id) {
        messageDao.deleteById(id);
    }
}