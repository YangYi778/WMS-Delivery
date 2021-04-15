import request from '@/utils/request'

// 查询批次规则列表
export function listBatchRule(query) {
  return request({
    url: '/system/batchRule/list',
    method: 'get',
    params: query
  })
}

// 查询批次规则详细
export function getBatchRule(id) {
  return request({
    url: '/system/batchRule/' + id,
    method: 'get'
  })
}

// 新增批次规则
export function addBatchRule(data) {
  return request({
    url: '/system/batchRule',
    method: 'post',
    data: data
  })
}

// 修改批次规则
export function updateBatchRule(data) {
  return request({
    url: '/system/batchRule',
    method: 'put',
    data: data
  })
}

// 删除批次规则
export function delBatchRule(id) {
  return request({
    url: '/system/batchRule/' + id,
    method: 'delete'
  })
}

// 导出批次规则
export function exportBatchRule(query) {
  return request({
    url: '/system/batchRule/export',
    method: 'get',
    params: query
  })
}