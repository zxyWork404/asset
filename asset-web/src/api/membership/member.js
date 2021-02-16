import request from '@/utils/request'

// 查询入会用户列表
export function list(query) {
  return request({
    url: '/membership/user/list',
    method: 'get',
    params: query
  })
}


