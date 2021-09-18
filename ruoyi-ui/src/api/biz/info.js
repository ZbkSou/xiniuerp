import request from '@/utils/request'

// 查询商品信息列表
export function listInfo(query) {
  return request({
    url: '/biz/productinfo/list',
    method: 'get',
    params: query
  })
}

// 查询商品信息详细
export function getInfo(id) {
  return request({
    url: '/biz/productinfo/' + id,
    method: 'get'
  })
}

// 新增商品信息
export function addInfo(data) {
  return request({
    url: '/biz/productinfo',
    method: 'post',
    data: data
  })
}

// 修改商品信息
export function updateInfo(data) {
  return request({
    url: '/biz/productinfo',
    method: 'put',
    data: data
  })
}

// 删除商品信息
export function delInfo(id) {
  return request({
    url: '/biz/productinfo/' + id,
    method: 'delete'
  })
}

// 导出商品信息
export function exportInfo(query) {
  return request({
    url: '/biz/productinfo/export',
    method: 'get',
    params: query
  })
}
