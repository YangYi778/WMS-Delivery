import request from '@/utils/request'

// 获取首页面板数据
export function getIndexInfo(day) {
  return request({
    url: '/system/index/' + day,
    method: 'get'
  })
}
