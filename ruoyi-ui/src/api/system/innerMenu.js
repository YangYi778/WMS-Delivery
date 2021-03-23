import request from '@/utils/request'

// 查询订单管理列表
export function listOrderMenu(query) {
  return request({
    url: '/system/orderMenu/list',
    method: 'get',
    params: query
  })
}

// 查询订单管理详细
export function getOrderMenu(id) {
  return request({
    url: '/system/orderMenu/' + id,
    method: 'get'
  })
}

// 新增订单管理
export function addOrderMenu(data) {
  return request({
    url: '/system/orderMenu',
    method: 'post',
    data: data
  })
}

// 修改订单管理
export function updateOrderMenu(data) {
  return request({
    url: '/system/orderMenu',
    method: 'put',
    data: data
  })
}

// 删除订单管理
export function delOrderMenu(id) {
  return request({
    url: '/system/orderMenu/' + id,
    method: 'delete'
  })
}

// 导出订单管理
export function exportOrderMenu(query) {
  return request({
    url: '/system/orderMenu/export',
    method: 'get',
    params: query
  })
}
