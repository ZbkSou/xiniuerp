import request from '@/utils/request'

// 查询进货列表
export function listPurchasing(query) {
  return request({
    url: '/biz/purchasing/list',
    method: 'get',
    params: query
  })
}

// 查询进货详细
export function getPurchasing(id) {
  return request({
    url: '/biz/purchasing/' + id,
    method: 'get'
  })
}

// 新增进货
export function addPurchasing(data) {
  return request({
    url: '/biz/purchasing',
    method: 'post',
    data: data
  })
}

// 修改进货
export function updatePurchasing(data) {
  return request({
    url: '/biz/purchasing',
    method: 'put',
    data: data
  })
}

// 删除进货
export function delPurchasing(id) {
  return request({
    url: '/biz/purchasing/' + id,
    method: 'delete'
  })
}

// 导出进货
export function exportPurchasing(query) {
  return request({
    url: '/biz/purchasing/export',
    method: 'get',
    params: query
  })
}