package com.yuanlrc.campus_market.controller.home;

import com.yuanlrc.campus_market.bean.CodeMsg;
import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.bean.Result;
import com.yuanlrc.campus_market.entity.common.Message;
import com.yuanlrc.campus_market.entity.common.Student;
import com.yuanlrc.campus_market.service.common.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 前台消息通知控制器
 */
@Controller
@RequestMapping("/home/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    /**
     * 消息列表页面
     */
    @RequestMapping("/list")
    public String list(Model model, PageBean<Message> pageBean, HttpServletRequest request) {
        Student student = (Student) request.getSession().getAttribute("ylrc_student");
        if (student == null) {
            return "redirect:/home/index/login";
        }

        // 分页查询消息
        pageBean.setPageSize(10); // 每页显示10条
        pageBean = messageService.findList(pageBean, student.getId());
        model.addAttribute("pageBean", pageBean);

        // 未读消息数量
        Long unreadCount = messageService.getUnreadCount(student.getId());
        model.addAttribute("unreadCount", unreadCount);

        return "home/message/list";
    }

    /**
     * 获取未读消息数量（AJAX接口）
     */
    @RequestMapping("/unread_count")
    @ResponseBody
    public Result<Map<String, Object>> getUnreadCount(HttpServletRequest request) {
        Map<String, Object> data = new HashMap<>();
        Student student = (Student) request.getSession().getAttribute("ylrc_student");

        if (student != null) {
            Long count = messageService.getUnreadCount(student.getId());
            data.put("code", 0);
            data.put("count", count);
        } else {
            data.put("code", -1);
            data.put("msg", "未登录");
        }

        return Result.success(data);
    }

    /**
     * 标记消息为已读
     */
    @RequestMapping(value = "/mark_read", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> markAsRead(@RequestParam("id") Long messageId, HttpServletRequest request) {
        Student student = (Student) request.getSession().getAttribute("ylrc_student");

        if (student == null) {
            return Result.error(CodeMsg.VALIDATE_ENTITY_ERROR);
        }

        messageService.markAsRead(messageId);
        return Result.success(true);
    }

    /**
     * 标记所有消息为已读
     */
    @RequestMapping(value = "/mark_all_read", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> markAllAsRead(HttpServletRequest request) {
        Student student = (Student) request.getSession().getAttribute("ylrc_student");

        if (student == null) {
            return Result.error(CodeMsg.VALIDATE_ENTITY_ERROR);
        }

        messageService.markAllAsRead(student.getId());
        return Result.success(true);
    }
}