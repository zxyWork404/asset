package com.asset.web.controller.register;


import com.asset.common.core.controller.BaseController;
import com.asset.common.core.page.TableDataInfo;
import com.asset.common.utils.KafkaSender;
import com.asset.register.domain.RegisterUser;
import com.asset.register.service.RegisterUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/register/user")
@Slf4j
public class RegisterUserController extends BaseController {

    @Resource
    private RegisterUserService registerUserService;
    @Resource
    private KafkaSender KafkaSender;

    @PreAuthorize("@ss.hasPermi('register:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(RegisterUser registerUser){
        startPage();
        registerUser.setRegisterType(1);
        List<RegisterUser> list = registerUserService.selectRegisterUserList(registerUser);
        return getDataTable(list);
    }
}
