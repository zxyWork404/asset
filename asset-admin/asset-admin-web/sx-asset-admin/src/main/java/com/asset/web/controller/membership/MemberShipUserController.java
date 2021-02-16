package com.asset.web.controller.membership;


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
@RequestMapping("/membership/user")
@Slf4j
public class MemberShipUserController extends BaseController {

    @Resource
    private RegisterUserService registerUserService;
    @Resource
    private KafkaSender KafkaSender;

    @PreAuthorize("@ss.hasPermi('membership:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(RegisterUser registerUser){
        startPage();
        List<RegisterUser> list = registerUserService.selectMemberUserList(registerUser);
        return getDataTable(list);
    }

}
