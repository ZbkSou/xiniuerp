-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('进货', '3', '1', 'purchasing', 'biz/purchasing/index', 1, 0, 'C', '0', '0', 'biz:purchasing:list', '#', 'admin', sysdate(), '', null, '进货菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('进货查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'biz:purchasing:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('进货新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'biz:purchasing:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('进货修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'biz:purchasing:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('进货删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'biz:purchasing:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('进货导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'biz:purchasing:export',       '#', 'admin', sysdate(), '', null, '');