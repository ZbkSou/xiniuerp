import request from '@/utils/request'

// 查询订单详情列表
export function listDetail(query) {
  return request({
    url: '/biz/detail/list',
    method: 'get',
    params: query
  })
}

// 查询订单详情详细
export function getDetail(id) {
  return request({
    url: '/biz/detail/' + id,
    method: 'get'
  })
}

// 新增订单详情
export function addDetail(data) {
  return request({
    url: '/biz/detail',
    method: 'post',
    data: data
  })
}

// 修改订单详情
export function updateDetail(data) {
  return request({
    url: '/biz/detail',
    method: 'put',
    data: data
  })
}

// 删除订单详情
export function delDetail(id) {
  return request({
    url: '/biz/detail/' + id,
    method: 'delete'
  })
}

// 导出订单详情
export function exportDetail(query) {
  return request({
    url: '/biz/detail/export',
    method: 'get',
    params: query
  })
}