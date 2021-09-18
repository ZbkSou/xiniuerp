-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('三方平台', '3', '1', 'token', 'biz/token/index', 1, 0, 'C', '0', '0', 'biz:token:list', '#', 'admin', sysdate(), '', null, '三方平台菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('三方平台查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'biz:token:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('三方平台新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'biz:token:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('三方平台修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'biz:token:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('三方平台删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'biz:token:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('三方平台导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'biz:token:export',       '#', 'admin', sysdate(), '', null, '');