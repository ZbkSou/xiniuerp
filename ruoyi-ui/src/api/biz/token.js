import request from '@/utils/request'

// 查询三方平台列表
export function listToken(query) {
  return request({
    url: '/biz/token/list',
    method: 'get',
    params: query
  })
}

// 查询三方平台详细
export function getToken(id) {
  return request({
    url: '/biz/token/' + id,
    method: 'get'
  })
}

// 新增三方平台
export function addToken(data) {
  return request({
    url: '/biz/token',
    method: 'post',
    data: data
  })
}

// 修改三方平台
export function updateToken(data) {
  return request({
    url: '/biz/token',
    method: 'put',
    data: data
  })
}

// 删除三方平台
export function delToken(id) {
  return request({
    url: '/biz/token/' + id,
    method: 'delete'
  })
}

// 导出三方平台
export function exportToken(query) {
  return request({
    url: '/biz/token/export',
    method: 'get',
    params: query
  })
}