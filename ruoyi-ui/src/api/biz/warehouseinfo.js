import request from '@/utils/request'

// 查询仓库信息列表
export function listInfo(query) {
  return request({
    url: '/biz/warehouseinfo/list',
    method: 'get',
    params: query
  })
}

// 查询仓库信息详细
export function getInfo(wId) {
  return request({
    url: '/biz/warehouseinfo/' + wId,
    method: 'get'
  })
}

// 新增仓库信息
export function addInfo(data) {
  return request({
    url: '/biz/warehouseinfo',
    method: 'post',
    data: data
  })
}

// 修改仓库信息
export function updateInfo(data) {
  return request({
    url: '/biz/warehouseinfo',
    method: 'put',
    data: data
  })
}

// 删除仓库信息
export function delInfo(wId) {
  return request({
    url: '/biz/warehouseinfo/' + wId,
    method: 'delete'
  })
}

// 导出仓库信息
export function exportInfo(query) {
  return request({
    url: '/biz/warehouseinfo/export',
    method: 'get',
    params: query
  })
}
