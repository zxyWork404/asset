// 错误页
import {ROUTER_PERMISSION_TYPE} from '@/router/router-const';

export const registerRouter = [
  {
    path: '/register',
    name: 'Register',
    meta: {
      hideInMenu: true,
      access: true,
      permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
    },
    component: () => import('views/register/register.vue')
  }
];
