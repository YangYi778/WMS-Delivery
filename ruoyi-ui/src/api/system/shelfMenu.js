import request from '@/utils/request'

// 查询货架管理列表
export function listShelfMenu(query) {
  return request({
    url: '/system/shelfMenu/list',
    method: 'get',
    params: query
  })
}

// 查询货架管理详细
export function getShelfMenu(id) {
  return request({
    url: '/system/shelfMenu/' + id,
    method: 'get'
  })
}

// 新增货架管理
export function addShelfMenu(data) {
  return request({
    url: '/system/shelfMenu',
    method: 'post',
    data: data
  })
}

// 修改货架管理
export function updateShelfMenu(data) {
  return request({
    url: '/system/shelfMenu',
    method: 'put',
    data: data
  })
}

// 删除货架管理
export function delShelfMenu(id) {
  return request({
    url: '/system/shelfMenu/' + id,
    method: 'delete'
  })
}

// 导出货架管理
export function exportShelfMenu(query) {
  return request({
    url: '/system/shelfMenu/export',
    method: 'get',
    params: query
  })
}