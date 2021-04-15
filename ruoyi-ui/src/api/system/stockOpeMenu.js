import request from '@/utils/request'

// 查询商品管理列表
export function listGoodMenu(query) {
  return request({
    url: '/system/goodMenu/list',
    method: 'get',
    params: query
  })
}

// 查询商品管理详细
export function getGoodMenu(id) {
  return request({
    url: '/system/goodMenu/' + id,
    method: 'get'
  })
}

// 新增商品管理
export function addGoodMenu(data) {
  return request({
    url: '/system/goodMenu',
    method: 'post',
    data: data
  })
}

// 修改商品管理
export function updateGoodMenu(data) {
  return request({
    url: '/system/goodMenu',
    method: 'put',
    data: data
  })
}

// 删除商品管理
export function delGoodMenu(id) {
  return request({
    url: '/system/goodMenu/' + id,
    method: 'delete'
  })
}

// 导出商品管理
export function exportGoodMenu(query) {
  return request({
    url: '/system/goodMenu/export',
    method: 'get',
    params: query
  })
}