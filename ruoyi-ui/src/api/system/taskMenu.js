import request from '@/utils/request'

// 查询任务管理列表
export function listTaskMenu(query) {
  return request({
    url: '/system/taskMenu/list',
    method: 'get',
    params: query
  })
}

// 查询任务管理详细
export function getTaskMenu(id) {
  return request({
    url: '/system/taskMenu/' + id,
    method: 'get'
  })
}

// 新增任务管理
export function addTaskMenu(data) {
  return request({
    url: '/system/taskMenu',
    method: 'post',
    data: data
  })
}

// 修改任务管理
export function updateTaskMenu(data) {
  return request({
    url: '/system/taskMenu',
    method: 'put',
    data: data
  })
}

// 获取关联信息
export function getRelatedInfo(taskModel) {
  console.info("taskModel == " + taskModel)
  return request({
    url: '/system/taskMenu/relatedInfo/' + taskModel,
    method: 'get'
  })
}

// 删除任务管理
export function delTaskMenu(id) {
  return request({
    url: '/system/taskMenu/' + id,
    method: 'delete'
  })
}

// 导出任务管理
export function exportTaskMenu(query) {
  return request({
    url: '/system/taskMenu/export',
    method: 'get',
    params: query
  })
}
