import request from '@/utils/request'

// 查询订单主列表
export function listMaster(query) {
  return request({
    url: '/biz/master/list',
    method: 'get',
    params: query
  })
}

// 查询订单主详细
export function getMaster(id) {
  return request({
    url: '/biz/master/' + id,
    method: 'get'
  })
}

// 新增订单主
export function addMaster(data) {
  return request({
    url: '/biz/master',
    method: 'post',
    data: data
  })
}

// 修改订单主
export function updateMaster(data) {
  return request({
    url: '/biz/master',
    method: 'put',
    data: data
  })
}

// 删除订单主
export function delMaster(id) {
  return request({
    url: '/biz/master/' + id,
    method: 'delete'
  })
}

// 导出订单主
export function exportMaster(query) {
  return request({
    url: '/biz/master/export',
    method: 'get',
    params: query
  })
}