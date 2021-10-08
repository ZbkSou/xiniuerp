import request from '@/utils/request'

// 查询供应商信息列表
export function listInfo(query) {
  return request({
    url: '/biz/supplierinfo/list',
    method: 'get',
    params: query
  })
}

// 查询供应商信息详细
export function getInfo(supplierId) {
  return request({
    url: '/biz/supplierinfo/' + supplierId,
    method: 'get'
  })
}

// 新增供应商信息
export function addInfo(data) {
  return request({
    url: '/biz/supplierinfo',
    method: 'post',
    data: data
  })
}

// 修改供应商信息
export function updateInfo(data) {
  return request({
    url: '/biz/supplierinfo',
    method: 'put',
    data: data
  })
}

// 删除供应商信息
export function delInfo(supplierId) {
  return request({
    url: '/biz/supplierinfo/' + supplierId,
    method: 'delete'
  })
}

// 导出供应商信息
export function exportInfo(query) {
  return request({
    url: '/biz/supplierinfo/export',
    method: 'get',
    params: query
  })
}
