import request from '@/utils/request'

// 查询注册用户列表
export function list(query) {
  return request({
    url: '/register/user/list',
    method: 'get',
    params: query
  })
}

//注册用户审核提醒
export function sendMessage(query) {
  return request({
    url: '/examine/user/sendMessage',
    method: 'post',
    params: query
  })
}

//审核注册用户
export function saveExamine(query) {
  return request({
    url: '/examine/user/saveExamine',
    method: 'post',
    params: query
  })
}

//审核注册用户
export function listExamine(query) {
  return request({
    url: '/examine/user/list',
    method: 'get',
    params: query
  })
}


