import request from '@/utils/request'

// 查询定位规则列表
export function listLocationRule(query) {
  return request({
    url: '/system/locationRule/list',
    method: 'get',
    params: query
  })
}

// 查询定位规则详细
export function getLocationRule(id) {
  return request({
    url: '/system/locationRule/' + id,
    method: 'get'
  })
}

// 新增定位规则
export function addLocationRule(data) {
  return request({
    url: '/system/locationRule',
    method: 'post',
    data: data
  })
}

// 修改定位规则
export function updateLocationRule(data) {
  return request({
    url: '/system/locationRule',
    method: 'put',
    data: data
  })
}

// 删除定位规则
export function delLocationRule(id) {
  return request({
    url: '/system/locationRule/' + id,
    method: 'delete'
  })
}

// 导出定位规则
export function exportLocationRule(query) {
  return request({
    url: '/system/locationRule/export',
    method: 'get',
    params: query
  })
}