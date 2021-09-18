import request from '@/utils/request'

// 查询发货成本列表
export function listCost(query) {
  return request({
    url: '/biz/cost/list',
    method: 'get',
    params: query
  })
}

// 查询发货成本详细
export function getCost(id) {
  return request({
    url: '/biz/cost/' + id,
    method: 'get'
  })
}

// 新增发货成本
export function addCost(data) {
  return request({
    url: '/biz/cost',
    method: 'post',
    data: data
  })
}

// 修改发货成本
export function updateCost(data) {
  return request({
    url: '/biz/cost',
    method: 'put',
    data: data
  })
}

// 删除发货成本
export function delCost(id) {
  return request({
    url: '/biz/cost/' + id,
    method: 'delete'
  })
}

// 导出发货成本
export function exportCost(query) {
  return request({
    url: '/biz/cost/export',
    method: 'get',
    params: query
  })
}