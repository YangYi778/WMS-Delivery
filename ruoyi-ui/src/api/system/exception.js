import request from '@/utils/request'

// 查询异常信息列表
export function listException(query) {
  return request({
    url: '/system/exception/list',
    method: 'get',
    params: query
  })
}

// 查询异常信息详细
export function getException(id) {
  return request({
    url: '/system/exception/' + id,
    method: 'get'
  })
}

// 新增异常信息
export function addException(data) {
  return request({
    url: '/system/exception',
    method: 'post',
    data: data
  })
}

// 修改异常信息
export function updateException(data) {
  return request({
    url: '/system/exception',
    method: 'put',
    data: data
  })
}

// 删除异常信息
export function delException(id) {
  return request({
    url: '/system/exception/' + id,
    method: 'delete'
  })
}

// 导出异常信息
export function exportException(query) {
  return request({
    url: '/system/exception/export',
    method: 'get',
    params: query
  })
}