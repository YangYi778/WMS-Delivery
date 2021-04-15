import request from '@/utils/request'

// 查询任务规则列表
export function listTaskRule(query) {
  return request({
    url: '/system/taskRule/list',
    method: 'get',
    params: query
  })
}

// 查询任务规则详细
export function getTaskRule(id) {
  return request({
    url: '/system/taskRule/' + id,
    method: 'get'
  })
}

// 新增任务规则
export function addTaskRule(data) {
  return request({
    url: '/system/taskRule',
    method: 'post',
    data: data
  })
}

// 修改任务规则
export function updateTaskRule(data) {
  return request({
    url: '/system/taskRule',
    method: 'put',
    data: data
  })
}

// 删除任务规则
export function delTaskRule(id) {
  return request({
    url: '/system/taskRule/' + id,
    method: 'delete'
  })
}

// 导出任务规则
export function exportTaskRule(query) {
  return request({
    url: '/system/taskRule/export',
    method: 'get',
    params: query
  })
}