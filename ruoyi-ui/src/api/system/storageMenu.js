import request from '@/utils/request'

// 查询库区管理列表
export function listStorageMenu(query) {
  return request({
    url: '/system/storageMenu/list',
    method: 'get',
    params: query
  })
}

// 查询库区管理详细
export function getStorageMenu(id) {
  return request({
    url: '/system/storageMenu/' + id,
    method: 'get'
  })
}

// 新增库区管理
export function addStorageMenu(data) {
  return request({
    url: '/system/storageMenu',
    method: 'post',
    data: data
  })
}

// 修改库区管理
export function updateStorageMenu(data) {
  return request({
    url: '/system/storageMenu',
    method: 'put',
    data: data
  })
}

// 删除库区管理
export function delStorageMenu(id) {
  return request({
    url: '/system/storageMenu/' + id,
    method: 'delete'
  })
}

// 导出库区管理
export function exportStorageMenu(query) {
  return request({
    url: '/system/storageMenu/export',
    method: 'get',
    params: query
  })
}