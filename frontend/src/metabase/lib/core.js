import { TYPE } from "metabase/lib/types";

export const field_special_types = [{
    'id': TYPE.PK,
    'name': 'Entity Key',
    'section': 'Overall Row',
    'description': '表主键.'
}, {
    'id': TYPE.Name,
    'name': 'Entity Name',
    'section': 'Overall Row',
    'description': '每个记录的“名称”。通常是一个名为“名称”、“标题”的列.'
}, {
    'id': TYPE.FK,
    'name': 'Foreign Key',
    'section': 'Overall Row',
    'description': '指向另一个表以进行连接.'
}, {
    'id': TYPE.AvatarURL,
    'name': 'Avatar Image URL',
    'section': 'Common'
}, {
    'id': TYPE.Category,
    'name': 'Category',
    'section': 'Common'
}, {
    'id': TYPE.City,
    'name': 'City',
    'section': 'Common'
}, {
    'id': TYPE.Country,
    'name': 'Country',
    'section': 'Common'
}, {
    'id': TYPE.Description,
    'name': 'Description',
    'section': 'Common'
}, {
    'id': TYPE.Email,
    'name': 'Email',
    'section': 'Common'
}, {
    'id': TYPE.ImageURL,
    'name': 'Image URL',
    'section': 'Common'
}, {
    'id': TYPE.SerializedJSON,
    'name': 'Field containing JSON',
    'section': 'Common'
}, {
    'id': TYPE.Latitude,
    'name': 'Latitude',
    'section': 'Common'
}, {
    'id': TYPE.Longitude,
    'name': 'Longitude',
    'section': 'Common'
}, {
    'id': TYPE.Number,
    'name': 'Number',
    'section': 'Common'
}, {
    'id': TYPE.State,
    'name': 'State',
    'section': 'Common'
}, {
    id: TYPE.UNIXTimestampSeconds,
    name: 'UNIX Timestamp (Seconds)',
    'section': 'Common'
}, {
    id: TYPE.UNIXTimestampMilliseconds,
    name: 'UNIX Timestamp (Milliseconds)',
    'section': 'Common'
}, {
    'id': TYPE.URL,
    'name': 'URL',
    'section': 'Common'
}, {
    'id': TYPE.ZipCode,
    'name': 'Zip Code',
    'section': 'Common'
}];

export const field_special_types_map = field_special_types
    .reduce((map, type) => Object.assign({}, map, {[type.id]: type}), {});

export const field_visibility_types = [{
    'id': 'normal',
    'name': 'Everywhere',
    'description': '默认设置。此字段将在表格和图表中正常显示。.'
}, {
    'id': 'details-only',
    'name': 'Only in Detail Views',
    'description': "只有在查看单个记录的详细信息时才会显示此字段。对于冗长或在表格或图表中不起作用的信息，请使用此信息。"
}, {
    'id': 'sensitive',
    'name': 'Do Not Include',
    'description': ' 永远不会检索这个字段。用于字段内容敏感或无关信息.'
}];
