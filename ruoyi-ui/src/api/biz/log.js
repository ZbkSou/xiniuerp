import request from '@/utils/request'

// 查询发货记录列表
export function listLog(query) {
  return request({
    url: '/biz/log/list',
    method: 'get',
    params: query
  })
}

// 查询发货记录详细
export function getLog(id) {
  return request({
    url: '/biz/log/' + id,
    method: 'get'
  })
}

// 新增发货记录
export function addLog(data) {
  return request({
    url: '/biz/log',
    method: 'post',
    data: data
  })
}

// 修改发货记录
export function updateLog(data) {
  return request({
    url: '/biz/log',
    method: 'put',
    data: data
  })
}

// 删除发货记录
export function delLog(id) {
  return request({
    url: '/biz/log/' + id,
    method: 'delete'
  })
}

// 导出发货记录
export function exportLog(query) {
  return request({
    url: '/biz/log/export',
    method: 'get',
    params: query
  })
}