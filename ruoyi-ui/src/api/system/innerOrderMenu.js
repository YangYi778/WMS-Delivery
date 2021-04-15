import request from '@/utils/request'

// 查询订单管理列表
export function listOrderMenu(query) {
  debugger
  return request({
    url: '/system/innerOrder/list',
    method: 'get',
    params: query
  })
}

// 查询订单管理详细
export function getOrderMenu(id) {
  return request({
    url: '/system/innerOrder/' + id,
    method: 'get'
  })
}

// 新增订单管理
export function addOrderMenu(data) {
  return request({
    url: '/system/innerOrder',
    method: 'post',
    data: data
  })
}

// 修改订单管理
export function updateOrderMenu(data) {
  return request({
    url: '/system/innerOrder',
    method: 'put',
    data: data
  })
}

// 删除订单管理
export function delOrderMenu(id) {
  return request({
    url: '/system/innerOrder/' + id,
    method: 'delete'
  })
}

// 订单受理操作
export function orderConfirm(orders) {
  debugger
  console.info("js方法：" + orders);
  return request({
    url: '/system/innerOrder/' + orders,
    method: 'put'
  })
}

export function orderBatchGenerate(orders) {
  console.info("orderBatchGenerate方法:" + orders);
  return request({
    url: '/system/innerOrder/generate/' + orders,
    method: 'put'
  })
}

// 导出订单管理
export function exportOrderMenu(query) {
  return request({
    url: '/system/innerOrder/export',
    method: 'get',
    params: query
  })
}
